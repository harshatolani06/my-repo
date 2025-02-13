//external api
public class CurrencyConvertorClass {
    public static Decimal convertCurrencyToInr(Decimal eur){
        
       Decimal inr = 0.0;
        
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        string endPointURL = 'https://api.apilayer.com/exchangerates_data/convert?to=inr&from=eur&amount=25';
        req.setEndpoint(endPointURL);
        req.setHeader('apikey', 'mqwOV1GFSqIZx4GqXCZwceRbLPHdW7Pw');
        req.setMethod('GET');
        
        HTTPResponse res = h.send(req);
        
        Map<String,Object> jsonBody = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        
        System.debug(jsonBody.get('result'));
        
        Map<String, Object> mMap = (Map<String,Object>)	jsonBody.get('info');
        System.debug(jsonBody.get('info'));

        //system.debug(mMap);
        //Decimal conversionRate = (Decimal) mMap.get('rate');
        //inr = eur * conversionRate;
        Decimal totalConvertedAmount = (Decimal) jsonBody.get('result');
        return totalConvertedAmount; 
        
         
    }
}