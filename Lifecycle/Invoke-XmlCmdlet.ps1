#requires -version 3
<#
.SYNOPSIS
  Invoke PwrBuilder
 
.DESCRIPTION
  Runs PwrBuilder
   
 
.NOTES
  Version:        0.1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>
 
  
Function Invoke-XmlCmdlet{

  Param(
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
    [System.Xml.XmlElement[]] $XMLNodes

  )

  Begin{

    

  }
  
  Process{
    Try{

        $XMLNodes | Select-Xml -XPath "./*" | ForEach-Object {
            
            $Command = "Pwrbldr-Xml$($_.Node.Name)"
            
            $CommandArgument = ,$_.Node.ChildNodes
            
            try {
            
                Invoke-Expression "$Command $CommandArgument"

            }

            Catch {

                $Error[0]

            }
            
        }

    }
    
    Catch{
      Break
    }
  }
  
  End{
    If($?){
    }
  }
}