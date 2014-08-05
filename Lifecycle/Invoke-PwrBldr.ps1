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
 
  
Function Invoke-PwrBldr{

  Param(
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
    [xml] $PwrBldrXML

  )

  Begin{

    [string] $scriptContent = $null

  }
  
  Process{
    Try{

        $PwrBldrXML | Select-Xml -XPath "./*" | ForEach-Object {
        
            $_.Node | Invoke-XmlCmdlet -OutVariable $CmdletOutput
            $CmdletOutput
            
            
        }

        Invoke-Expression "$scriptContent"

    }
    
    Catch{
      $Error[0]
    }
  }
  
  End{
    If($?){
    }
  }
}