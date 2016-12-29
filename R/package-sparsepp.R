#' sparsepp
#'
#' \code{sparsepp} provides bindings to the
#' \href{https://github.com/greg7mdp/sparsepp}{sparsepp} - fast, memory efficient hash map for C++
#' \code{sparsepp} is an open source C++ library derived from Google's
#' excellent sparsehash implementation. It aims to achieve the following objectives:
#' \itemize{
#' \item A drop-in alternative for unordered_map and unordered_set.
#' \item Extremely low memory usage (typically about one byte overhead per entry).
#' \item Very efficient, typically faster than your compiler's unordered map/set or Boost's.
#' \item C++11 support (if supported by compiler).
#' \item Single header implementation - just copy sparsepp.h to your project and include it.
#' \item Tested on Windows (vs2010-2015, g++), linux (g++, clang++) and MacOS (clang++).
#'}
"_PACKAGE"
