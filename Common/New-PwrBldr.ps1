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
  )

  Begin{

    $ErrorActionPreference = "Continue"

    [string] $Global:PwrBldrInMemoryExpression = $null

    $pwrUserConfigPath = "$env:USERPROFILE\pwrbuilder\config.xml"

    if ((Test-Path $pwrUserConfigPath) -eq $false) {

        $configTemplate = @"
<pwrbldr version="0.1.0">
 <config>
 </config>
</pwrbldr>
"@ | Out-File $pwrUserConfigPath

    }


  }
  
  Process{
    Try{
    
       [xml] $pwrUserConfig = Get-Content $pwrUserConfigPath

       $pwrUserConfig | Write-Output
        
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