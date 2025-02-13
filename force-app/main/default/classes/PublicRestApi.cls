/*make site 
give access for class ,fields and object from profile
for testing : https://ibirds-a1-dev-ed.my.salesforce-sites.com/services/apexrest/ContactCreate/
raw data in body : {"First Name":"Harsha", "Last Name":"Tolani12344", "Email":"ibirds1234567@gmail.com"}
*/
@RestResource(urlMapping = '/ContactCreate/')
global class PublicRestApi {
    
    @HTTPPost
    global static string doPost()
    {
        String fieldValue;
        String fieldName;
        String fName;
        String lName;
        String email;
        
     
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        System.debug('Param is: '+req.params);
        System.debug('Param is: '+req.requestBody);
        
        String arr = req.requestBody.toString();
        
        JSONParser parser = JSON.createParser(arr);
        
        while(parser.nextToken()!=null)
        {
            if(parser.getCurrentToken()!= JSONToken.END_OBJECT){
                parser.nextValue();
                fieldName = parser.getCurrentName();
                fieldValue = parser.getText();
                
                if(fieldName == 'First Name')
                {
                    fName = parser.getText();
                }
                else if(fieldName == 'Last Name'){
                    lName = parser.getText();
                }
                else if(fieldName == 'Email'){
                    email = parser.getText();
                }
            }
        }
        
       Contact con = new Contact(FirstName=fName,lastName=lName,email=email);
        insert con;
        
        return con.Id;
    }

}