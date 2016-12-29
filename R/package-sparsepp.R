#' sparsepp
#'
#' \code{sparsepp} provides bindings to the
#' \href{https://github.com/greg7mdp/sparsepp}{sparsepp} - fast, memory efficient hash map for C++.
#' \code{sparsepp} is an open source C++ library derived from Google's
#' excellent sparsehash implementation, but considerably outperform it - \url{https://github.com/greg7mdp/sparsepp/blob/master/bench.md}.
#' It aims to achieve the following objectives:
#' \itemize{
#' \item A drop-in alternative for unordered_map and unordered_set.
#' \item Extremely low memory usage (typically about one byte overhead per entry).
#' \item Very efficient, typically faster than your compiler's unordered map/set or Boost's.
#' \item C++11 support (if supported by compiler).
#' \item Single header implementation - just copy sparsepp.h to your project and include it.
#' \item Tested on Windows (vs2010-2015, g++), linux (g++, clang++) and MacOS (clang++).
#' }
#' @examples
#' \dontrun{
#' library(Rcpp)
#' code = "
#' #include <Rcpp.h>
#' using namespace std;
#' using namespace Rcpp;
#' // drop-in replacement for unordered_map
#' //#include <unordered_map>
#' #include <sparsepp.h>
#' using spp::sparse_hash_map;
#' // @export
#' // [[Rcpp::export]]
#' IntegerVector word_count(CharacterVector v) {
#'   //unordered_map<string, int> smap;
#'   sparse_hash_map<string, int> smap;
#'   for(auto x: v) {
#'     smap[as<string>(x)] ++;
#'   }
#'   IntegerVector res(smap.size());
#'   int i = 0;
#'   for(auto s:smap) {
#'     res[i]=s.second;
#'     i++;
#'   }
#'   return(res);
#' }"
#' f = tempfile(, fileext = ".cpp")
#' writeLines(code, f)
#' sourceCpp(f)
#' unlink(f)
#' word_count(sample(letters, 100, T))
#'}
"_PACKAGE"
