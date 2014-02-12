package decaf;

import java.io.*;
import antlr.Token;
import java6G6Z1010.tools.CLI.*;

class Main {
    public static void main(String[] args) {
        try {
        	CLI.parse (args, new String[0]);
        	
        	InputStream inputStream = args.length == 0 ?
                    System.in : new java.io.FileInputStream(CLI.infile);

        	if (CLI.target == CLI.SCAN)
        	{
        		DecafScanner lexer = new DecafScanner(new DataInputStream(inputStream));
        		Token token;
        		boolean done = false;
        		while (!done)
        		{
        			try
        			{
		        		for (token=lexer.nextToken(); token.getType()!=DecafParserTokenTypes.EOF; token=lexer.nextToken())
		        		{
		        			String type = "";
		        			String text = token.getText();
		
		        			switch (token.getType())
		        			{
		        			
		        			case DecafScannerTokenTypes.ID:
		        				type = ": IDENTIFIER: ";
		        				break;
		        				
		        			case DecafScannerTokenTypes.CHAR:
		        				type = ": Charliteral: ";
		        				break;		 
		        				
		        			case DecafScannerTokenTypes.STRING:
		        				type = ": Stringliteral: ";
		        				break;
		        				
		        			case DecafScannerTokenTypes.HEX:
		        				type = ": INTLITERAL: ";
		        				break;
		        				
		        			case DecafScannerTokenTypes.INT:
		        				type = ": INTLITERAL: ";
		        				break;
		        			case DecafScannerTokenTypes.BOOL:
		        				type = ": BOOLEANLITERAL: ";
		        				break;
		        				
		        			}
		        			System.out.println (token.getLine() + type + " " + text);
		        		}
		        		done = true;
        			} catch(Exception e) {
        	        	// print the error:
        	            System.out.println(CLI.infile+" "+e);
        	            lexer.consume ();
        	        }
        		}
        	}
        	
        	else if (CLI.target == CLI.PARSE || CLI.target == CLI.DEFAULT)
        	{
        		DecafScanner lexer = new DecafScanner(new DataInputStream(inputStream));
        		DecafParser parser = new DecafParser (lexer);
                parser.program();
        	}
        	
        } catch(Exception e) {
        	// print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }
}

