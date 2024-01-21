module FloraWeb.Pages.Server.Admin.PackageRepo where

import FloraWeb.Pages.Routes.Admin.PackageRepo

server :: ServerT Routes FloraPage
server =
  Routes'
    { index = indexHandler
    , addPackageRepo = undefined
    }

indexHandler :: FloraPage (Html ())
indexHandler = do
  session <- getSession
  templateEnv <- fromSession session defaultTemplateEnv
  packageIndexes <- Query.getAllPackageIndexes
  render templateEnv $ Template.index packageIndexes
