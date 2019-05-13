/*
 * 5. Balanced Brackets
 * A bracket is any one of the following: (, ), {, }, [, or ]
 * 
 * The following are balanced brackets:
 *    ( )
 *    ( ) ( )
 *    ( ( ) )
 *    ( { [ ] } )
 *
 * The following are NOT balanced brackets:
 *   (
 *   )
 *   ( ( )
 *   ( [ ) ]
 *
 * Return true if balanced
 * Return false if not balanced
*/



public with sharing class bracketsAreBalanced3 {

    public static Boolean bracketsAreBalanced3(String s){
        String [] st = new List<String>();
        String[] c = s.split('');
        String r;

        String x = '';
        Integer n = 0;
        for(Integer i =0; i< s.length();i++){
            String ch = c[i];
            if(ch=='(' ||ch=='{' ||ch=='[' ){
                //n = n+1;
                st.add(c[i]);
                continue;
            }
            if(String.isEmpty(s)){
                return false;
            }
            switch on ch {
                
                when ')' {
                    r = st.remove(st.size()-1);
                    if (r =='{' || r =='[') {
                		return false; 
	                 }
                    
                	}
                when '}' {
                    r = st.remove(st.size()-1);
                    if (r =='(' || r =='[') {
                		return false; 
	                 }
                    
                	}
                when ']' {
                    r = st.remove(st.size()-1);
                    if (r =='{' || r =='(') {
                		return false; 
	                 }
                    
                	}
                
            }
        }
        
        if(st.isEmpty()){
           	System.debug('is balanced'); // return true;
        }else{

            System.debug('is not balanced'); //return false;
        }
        
        
    return NULL;//end of bracketsAreBalanced
    }
}


