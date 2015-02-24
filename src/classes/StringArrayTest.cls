public class StringArrayTest {
    
    public static List <String> generateStringArray(integer myNumber){
    
        List <String> myList = new List <String> ();
        for (integer i = 0; i < myNumber; i++){
            myList.add('Test ' + i);
            //System.debug(i);
        }
        
        return myList;
    }

}