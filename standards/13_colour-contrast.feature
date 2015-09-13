Feature: Color Contrast checker

 @manual
 Scenario: color Contrast

   Given I have setup snook color contract checker
   When I ckeck my page against Snook Color Contrast checker
   Then it should pass the color contrast test
