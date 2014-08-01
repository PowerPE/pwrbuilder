#requires -version 3
<#
.SYNOPSIS
  New PwrBuilder
 
.DESCRIPTION
  Creates new PwrBuilder xml structure
   
 
.NOTES
  Version:        0.1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>
 
  
Function New-PwrBldr{

  Param(
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
    [xml] $PwrBldrList
  )

  Begin{

  }
  
  Process{
    Try{
    

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