"use strict";(self.webpackChunkwebsite=self.webpackChunkwebsite||[]).push([[5627],{5845:(e,t,s)=>{s.r(t),s.d(t,{assets:()=>r,contentTitle:()=>l,default:()=>h,frontMatter:()=>i,metadata:()=>n,toc:()=>c});var n=s(8152),o=s(4848),a=s(8453);const i={slug:"validatinglocationtests",title:"Validate full addresses and formatted tests",authors:["claytont"],tags:["mtcustomtests","newtest"]},l=void 0,r={authorsImageUrls:[void 0]},c=[];function d(e){const t={li:"li",p:"p",ul:"ul",...(0,a.R)(),...e.components};return(0,o.jsxs)(o.Fragment,{children:[(0,o.jsx)(t.p,{children:"Added 3 new tests which I think the first two will be game changers. The first 2 are tests for validating locations, in which the user must have street, city, state, postal code, country, business phone, and company name the same as the valid location in the json. If you have 3 different addreses that your company uses, you can put each in there, and they are seen as 3 different addresses so it will only pass the location test if they have all the correct values for 1 location. The 2nd test is the same as the first, but I removed business phone in case your company doesn't have standard for it for all employees. The last test is formatting for user email accounts that should be formatted as all lower case and its first name period last name."}),"\n",(0,o.jsx)(t.p,{children:"ENTRA.UV.1010.L01 - All location information"}),"\n",(0,o.jsxs)(t.ul,{children:["\n",(0,o.jsx)(t.li,{children:"Test-ContosoUsersAllowedLocations.ps1"}),"\n",(0,o.jsx)(t.li,{children:"Test-ContosoUsersAllowedLocations.Tests.ps1"}),"\n",(0,o.jsx)(t.li,{children:"Test-ContosoUsersAllowedLocations.md"}),"\n"]}),"\n",(0,o.jsx)(t.p,{children:"ENTRA.UV.1010.L02 - All location information minus business phone"}),"\n",(0,o.jsxs)(t.ul,{children:["\n",(0,o.jsx)(t.li,{children:"Test-ContosoUsersAllowedLocationsNoBusinessPhones.ps1"}),"\n",(0,o.jsx)(t.li,{children:"Test-ContosoUsersAllowedLocationsNoBusinessPhones.Tests.ps1"}),"\n",(0,o.jsx)(t.li,{children:"Test-ContosoUsersAllowedLocationsNoBusinessPhones.md"}),"\n"]}),"\n",(0,o.jsx)(t.p,{children:"ENTRA.UF.1003.T03.Email - All lower case first name period last name"}),"\n",(0,o.jsxs)(t.ul,{children:["\n",(0,o.jsx)(t.li,{children:"Test-ContosoUsersFormattingFirstLastLowerCase.ps1"}),"\n",(0,o.jsx)(t.li,{children:"Test-ContosoUsersFormattingFirstLastLowerCase.Tests.ps1"}),"\n",(0,o.jsx)(t.li,{children:"Test-ContosoUsersFormattingFirstLastLowerCase.md"}),"\n"]}),"\n",(0,o.jsx)(t.p,{children:"Are there any other tests you'd like to see sooner than later?"}),"\n",(0,o.jsx)(t.p,{children:"Have a great day!"})]})}function h(e={}){const{wrapper:t}={...(0,a.R)(),...e.components};return t?(0,o.jsx)(t,{...e,children:(0,o.jsx)(d,{...e})}):d(e)}},8453:(e,t,s)=>{s.d(t,{R:()=>i,x:()=>l});var n=s(6540);const o={},a=n.createContext(o);function i(e){const t=n.useContext(a);return n.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function l(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(o):e.components||o:i(e.components),n.createElement(a.Provider,{value:t},e.children)}},8152:e=>{e.exports=JSON.parse('{"permalink":"/Custom-Maester-Tests/blog/validatinglocationtests","source":"@site/blog/2025-02-07-ValidatingLocationTests/index.md","title":"Validate full addresses and formatted tests","description":"Added 3 new tests which I think the first two will be game changers. The first 2 are tests for validating locations, in which the user must have street, city, state, postal code, country, business phone, and company name the same as the valid location in the json. If you have 3 different addreses that your company uses, you can put each in there, and they are seen as 3 different addresses so it will only pass the location test if they have all the correct values for 1 location. The 2nd test is the same as the first, but I removed business phone in case your company doesn\'t have standard for it for all employees. The last test is formatting for user email accounts that should be formatted as all lower case and its first name period last name.","date":"2025-02-07T00:00:00.000Z","tags":[{"inline":false,"label":"mtcustomtests","permalink":"/Custom-Maester-Tests/blog/tags/mtcustomtests","description":"All posts related directly to custom Maester tests"},{"inline":true,"label":"newtest","permalink":"/Custom-Maester-Tests/blog/tags/newtest"}],"readingTime":0.985,"hasTruncateMarker":false,"authors":[{"name":"Clayton Tyger","title":"Systems Administrator","url":"https://clatent.com","page":{"permalink":"/Custom-Maester-Tests/blog/authors/claytont"},"socials":{"linkedin":"https://www.linkedin.com/in/claytontyger/","github":"https://github.com/devclate","bluesky":"https://bsky.app/profile/devclate.bsky.social","x":"https://x.com/clatent"},"imageURL":"https://github.com/devclate.png","key":"claytont"}],"frontMatter":{"slug":"validatinglocationtests","title":"Validate full addresses and formatted tests","authors":["claytont"],"tags":["mtcustomtests","newtest"]},"unlisted":false,"nextItem":{"title":"Only Allow Company Standards","permalink":"/Custom-Maester-Tests/blog/validatingtests"}}')}}]);