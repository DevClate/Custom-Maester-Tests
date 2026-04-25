This test checks if Giphy content rating is set to Strict when Giphy is enabled in Microsoft Teams.

Contoso's company policy requires Giphy content rating to be set to Strict if Giphy is enabled to prevent inappropriate or offensive content from being shared in Teams conversations. The Strict setting applies the most restrictive content filtering.

**To remediate this issue:**

- Navigate to [Teams Admin Center - Messaging Policies](https://admin.teams.microsoft.com/policies/messaging)
- Select the **Global (Org-wide default)** policy
- Under **Gifs and stickers** section:
  - If **Use Giphys in conversations** is **On**, set **Giphy content rating** to **Strict**
  - Or consider disabling Giphy entirely by setting **Use Giphys in conversations** to **Off**
- Click **Save**

**Learn more:**

- [Manage messaging policies in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/messaging-policies-in-teams)
- [Use Giphy in Teams conversations](https://learn.microsoft.com/en-us/microsoftteams/messaging-policies-in-teams#giphy-settings)

<!--- Results --->

%TestResult%
