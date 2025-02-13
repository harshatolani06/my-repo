global class AccountBatchPracticeSchedular implements Schedulable{
		global void execute(SchedulableContext SC) {
      	AccountBatchPractice M = new AccountBatchPractice(); 
        database.executeBatch(M);
   }
}