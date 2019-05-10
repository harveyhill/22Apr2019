/*
 * 2. Sort an array of integers.
 * Test Cases:
 * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
 * Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
 *
 * Don't use the sort() method... that would be lame.
*/


/*
public static Integer[] sortArray( Integer[] intList ) {
}
public with sharing class sortArray(this was created by VS)
*/



public class sortArray {
    
    public static List<Integer> sortArray(List<Integer> intList){

        for(Integer i = 0 ; i < intList.size() ; i ++){
            
                for(integer j = i+1 ; j <= intList.size() -1 ; j ++ ){
                integer x = 0 ;
                
                if(intList[i] >  intList[j]){
                                                x = intList[i]  ;
                                                intList[i] = intList[j]  ;
                                                intList[j]  = x;
                                                system.debug(intList) ;
                                            }
                }           
        }

        return intlist;
    }
}
