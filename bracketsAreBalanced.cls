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

public with sharing class bracketsAreBalanced {

    public static Boolean bracketsAreBalanced ( String s )

    integer t;

    if (s == '(' );{
        t+= 1;
    }elseif 
    (s == ')');{
        t+= 1;
        }

        if ((t / 2) == 0)
            { 
                system.debug('brackets are Balanced'); 
            }
        else
            { 
            system.debug('brackets are not Balanced');
            }
    }
    Return s;
}
