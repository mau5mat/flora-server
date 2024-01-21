module FloraWeb.Pages.Routes.Admin where

import Data.Text (Text)
import GHC.Generics
import Lucid
import Servant
import Servant.HTML.Lucid

type Routes = NamedRoutes Routes'

data Routes' mode = Routes'
  { index :: mode :- Get '[HTML] (Html ())
  , addPackageRepo :: mode :- ReqBody '[HTML] PackageRepoPayload
  }
  deriving stock (Generic)

data PackageRepoPayload = PackageRepoPayload
  { repositoryName :: Text
  , url :: Text
  , description :: Text
  }
  deriving stock (Generic)
