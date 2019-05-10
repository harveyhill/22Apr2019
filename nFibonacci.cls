/*
 * 1. Return the nth Fibonacci number
 * Test Cases:
 * Input: 0     Output: 0
 * Input: 1    Output: 1
 * Input: 2     Output: 1
 * Input: 10    Output: 55
*/

public with sharing class nFibonacci {

        public static Integer nFibonacci( Integer n ){

        if (n==0){
            system.debug(n);
            return n;
        } else {

         integer fCount = n;
         integer[] num = new integer[fCount];
         num[0] = 1;
         num[1] = 1;

         for(integer i=2; i < fCount; i++){
             num[i] = num[i-1] + num[i-2];
         }
 
         for(integer i=0; i< fCount; i++){
                 System.debug(num[i] + ' ');
         }
 		return 0;
        }

    }
}
