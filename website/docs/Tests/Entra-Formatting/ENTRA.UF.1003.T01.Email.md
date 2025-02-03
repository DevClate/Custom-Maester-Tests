---
title: ENTRA.UF.1003.T01.Email - All Users should have a Capital-Initial Email Format
description: Enforce capital-first-initial email addresses for all Contoso users
---
## All Users should have a Capital-Initial Email Format

### Description

All user emails must have the first character of the given name in uppercase and the first character of the last name in uppercase, with the remaining letters in lowercase.

### How to fix

Confirm with HR the correct email format for the user.

Then run:

```powershell
Update-MgUser -UserID testuser@contoso.com -Mail "JSmith@contoso.com"
```

### Related links

- [Contoso Email Format Requirements](https://contoso.service-now.com/emailformat)
