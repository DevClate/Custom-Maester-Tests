BeforeAll {
    . $PSScriptRoot/Test-ContosoUsers{PURPOSE}.ps1
}

Describe "Contoso" -Tag "{TEST_ID}", "Entra", "CustomTests", "{CATEGORY_TAGS}", "Users" {
    It "{TEST_ID}: {DESCRIPTION}" {
        $result = Test-ContosoUsers{PURPOSE}
        $result | Should -Be $true -Because "{REASON}"
    }
}
