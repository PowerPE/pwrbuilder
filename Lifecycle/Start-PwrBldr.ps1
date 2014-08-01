#requires -version 3
<#
.SYNOPSIS
  Start PwrBuilder
 
.DESCRIPTION
  Starts PwrBuilder
   
 
.NOTES
  Version:        0.1.0
  Author:         Matthew Ratzke
  Creation Date:  04/04/2014
  
#>
 
  
Function Start-PwrBldr{

  Param(

  )

  Begin{

    $pwrUserConfigPath = "$env:USERPROFILE\pwrbuilder\config.xml"

    if ((Test-Path $pwrUserConfigPath) -eq $false) {

        $configTemplate = @"
<pwrbldr version="0.1.0">
 <config>
 </config>
</pwrbldr>
"@ | Out-File $pwrUserConfigPath

    }

    [xml] $pwrUserConfig = Get-Content $pwrUserConfigPath

  }
  
  Process{
    Try{
    
    $Global:PwrBldr = $pwrUserConfig

    $Global:PwrBldr | Invoke-PwrBldr

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