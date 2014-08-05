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
 
  
Function Pwrbldr-XmlConfig{

  Param(
    [Parameter(ValueFromPipeline=$true)]
    [System.Xml.XmlElement] $XMLChildNodes = $null
  )

  Begin{

    

  }
  
  Process{
    Try{

        if ($XMLChildNodes -ne $null) {
            $XMLChildNodes | Invoke-XmlCmdlet 
        }

        Write-Output "Hi Im the output of the <config> tag!!!"
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