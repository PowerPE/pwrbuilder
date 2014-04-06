# Check and Setup System Requirements

# Load Needed Components
Import-Module ShowUI

#Load Base UI
RibbonWindow { 
   Ribbon -Items {
      RibbonTab -Header "Task A" { 
         RibbonGroup -Header "PoshCode" { 
            # The ImageSource needs to be a path to an image...
            RibbonButton -LargeImageSource "http://huddledmasses.org/images/icons/PoshCode.png" -Label "PoshCode"
         }
      }
      RibbonTab -Header "Task B" 
   }
} -Title "PowerPE Builder" -Show

#Populate System with Defaults

#Override Defaults

#Load Extensions

#Run
