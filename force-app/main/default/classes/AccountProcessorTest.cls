@IsTest
public class AccountProcessorTest {
    @IsTest
    Private static void testCountContacts(){
        Account newAccount = new Account(Name='Test Account');
        insert newAccount;
        Contact newContact1 = new Contact(FirstName='Hafiza',LastName='Khan',AccountId = newAccount.Id);
        insert newContact1;
        Contact newContact2 = new Contact(FirstName='Jhon',LastName='Doe',AccountId = newAccount.Id);
        insert newContact2;
        
        List<Id> accountIds = new List<Id>();
        accountIds.add(newAccount.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
    }

}