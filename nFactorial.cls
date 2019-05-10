/*
 * 3. Return the factorial of n.
 * Test Cases:
 * Input: 0    Output: 1
 * Input: 1    Output: 1
 * Input: 3    Output: 6
*public with sharing class nFactorial {
*public nFactorial() {
*
*/

public class nFactorial {

    public static Integer nFactorial( Integer n) {
        
    if (n == 0 || n == 1) //factorial 0 and 1 are equal to 1
    	return 1;
 	else
     	return (n * nFactorial(n - 1)); 
       
	} 
  
}
