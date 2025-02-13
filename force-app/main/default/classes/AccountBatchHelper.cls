/*
	Name: AccountBatchHelper
	Author name: Harsha Tolani
	Date: 5/9/2022
	Description :In this we make helper for AccountBatchAssign2 to get size of the records and skip if alphabet is not present in records
*/

//Added by Harsha Tolani : 5/09/2022 This is a Helper class for AccountBatch Assign2
public class AccountBatchHelper {
    public string alphabetContains(List<Contact> contactRecords, string startAlphabet){
        Map<String, String> nextAlphabetMap = new Map<String, String>{'A' => 'B', 'B' => 'C', 'C' => 'D', 'D' => 'E','E' => 'F', 'F' => 'G', 'G' => 'H', 'H' => 'I','I' => 'J','J' => 'K','K' => 'L', 'L' => 'M', 'M' => 'N', 'N' => 'O','O' => 'P','P' => 'Q','Q' => 'R','R' => 'S', 'S' => 'T','T' => 'U', 'U' => 'V','V' => 'W','W' => 'X','X' => 'Y','Y' => 'Z','Z' => 'A'};
        boolean isContains = false;
        String nextAlphabet = startAlphabet;
        integer recordsSize = contactRecords.size()-1;
        for(integer index=0; index< contactRecords.size(); index++){
            if(!isContains && contactRecords[index].Name.toLowerCase().startsWith(nextAlphabet.toLowerCase())){
                isContains = true;
            }
            if(!isContains && recordsSize == index){
                nextAlphabet = nextAlphabetMap.get(nextAlphabet.toUpperCase());
                index = 0;
            }
        }
        return nextAlphabet;
    }

}