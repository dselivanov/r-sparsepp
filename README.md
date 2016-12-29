# Use `sparsepp` from another package
To use C++ code from `sparsepp`:

1. In DESCRIPTION, add `LinkingTo: sparsepp`.
1. In the C++ file, add:
  `#include <sparsepp.h>`

# Simple example

```c++
#include <sparsepp.h>
using spp::sparse_hash_map;
sparse_hash_map<string, int> smap;
```
# Defining custom hash function

```c++
#include <iostream>
#include <functional>
#include <string>
#include "sparsepp.h"

using std::string;

struct Person 
{
    bool operator==(const Person &o) const 
    { return _first == o._first && _last == o._last; }

    string _first;
    string _last;
};

namespace std
{
    // inject specialization of std::hash for Person into namespace std
    // ----------------------------------------------------------------
    template<> 
    struct hash<Person>
    {
        std::size_t operator()(Person const &p) const
        {
            std::size_t seed = 0;
            spp::hash_combine(seed, p._first);
            spp::hash_combine(seed, p._last);
            return seed;
        }
    };
}

int main()
{
    // As we have defined a specialization of std::hash() for Person, 
    // we can now create sparse_hash_set or sparse_hash_map of Persons
    // ----------------------------------------------------------------
    spp::sparse_hash_set<Person> persons = { { "John", "Galt" }, 
                                             { "Jane", "Doe" } };
    for (auto& p: persons)
        std::cout << p._first << ' ' << p._last << '\n';
}
```