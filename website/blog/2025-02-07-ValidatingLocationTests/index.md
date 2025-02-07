---
slug: validatinglocationtests
title: Validate full addresses and formatted tests
authors: [claytont]
tags: [mtcustomtests, newtest]
---
Added 3 new tests which I think the first two will be game changers. The first 2 are tests for validating locations, in which the user must have street, city, state, postal code, country, business phone, and company name the same as the valid location in the json. If you have 3 different addreses that your company uses, you can put each in there, and they are seen as 3 different addresses so it will only pass the location test if they have all the correct values for 1 location. The 2nd test is the same as the first, but I removed business phone in case your company doesn't have standard for it for all employees. The last test is formatting for user email accounts that should be formatted as all lower case and its first name period last name.


ENTRA.UV.1010.L01 - All location information

* Test-ContosoUsersAllowedLocations.ps1
* Test-ContosoUsersAllowedLocations.Tests.ps1
* Test-ContosoUsersAllowedLocations.md

ENTRA.UV.1010.L02 - All location information minus business phone

* Test-ContosoUsersAllowedLocationsNoBusinessPhones.ps1
* Test-ContosoUsersAllowedLocationsNoBusinessPhones.Tests.ps1
* Test-ContosoUsersAllowedLocationsNoBusinessPhones.md

ENTRA.UF.1003.T03.Email - All lower case first name period last name

* Test-ContosoUsersFormattingFirstLastLowerCase.ps1
* Test-ContosoUsersFormattingFirstLastLowerCase.Tests.ps1
* Test-ContosoUsersFormattingFirstLastLowerCase.md

Are there any other tests you'd like to see sooner than later?

Have a great day!
