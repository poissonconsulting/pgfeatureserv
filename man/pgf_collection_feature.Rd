% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/collection-feature.R
\name{pgf_collection_feature}
\alias{pgf_collection_feature}
\title{Get collection feature}
\usage{
pgf_collection_feature(
  collection_id,
  feature_id,
  base_url,
  path,
  properties = NULL,
  transform = NULL,
  nocache = NULL,
  user = gh_user(),
  verbose = FALSE,
  response = FALSE
)
}
\arguments{
\item{collection_id}{A character string of the collection id.}

\item{feature_id}{A positive whole number of the feature id.}

\item{base_url}{A character string of the base URL.}

\item{path}{A character string of the path or endpoint.}

\item{properties}{A vector of strings of the column names to include.
If NULL (default), all columns are retained.}

\item{transform}{A character vector with the name of the
\href{https://github.com/CrunchyData/pg_featureserv/blob/master/config/pg_featureserv.toml.example#L29}{\emph{valid transform}}
function followed by the parameter values (e.g. c("ST_Simplify", 100)).}

\item{nocache}{A character string indicating whether to cache results or not.
Possible values include 'true' or 'false' or NULL.}

\item{user}{A character string of the user. This allows whoever is running
the server your are querying to contact you in case of misuse.}

\item{verbose}{A flag indicating whether to provide verbose GET response.}

\item{response}{A flag indicating whether to return the raw response object.}
}
\value{
A sf object.
}
\description{
Get collection feature given collection_id, feature_id and optional query
parameters (see API specs \href{https://github.com/CrunchyData/pg_featureserv/blob/master/API.md#feature-collections}{here}).
}
\examples{
\dontrun{
pgf_collection_feature("whse_basemapping.fwa_wetlands_poly", limit = 1)
}
}
\seealso{
Other collections: 
\code{\link{pgf_collection_bbox}()},
\code{\link{pgf_collection_crs}()},
\code{\link{pgf_collection_description}()},
\code{\link{pgf_collection_features}()},
\code{\link{pgf_collection_geometry_type}()},
\code{\link{pgf_collection_properties}()},
\code{\link{pgf_collections}()}
}
\concept{collections}
