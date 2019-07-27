# Prestia Reconciler

> Reconcile the Prestia credit card statement with your manually maintained
> GNUCash exported output

## Example

```sh
./prestia-comparison.sh statement.csv gnu-cash-export.csv
```

## Output

The output is a standard diff between the statement and the gnu-cash-export
file. Before computing the diff, the files are converted into lines in this
form: `year month date transaction-amount`. After the conversion, once the two
files are sorted using `sort`, `diff` will tell you which transactions are there
in the statement but not in the gnu-cash-export (red) and which ones are there
in the gnu-cash-export but not in the statement (green).

This is a sample output from a random set of transactions and statement files:

```diff
1,20d0
< 2019 05 20 124
27d6
< 2019 05 22 124
37d15
< 2019 05 24 380
40d17
< 2019 05 24 980
43c20
< 2019 05 26 2620
---
> 2019 05 26 470
55d31
< 2019 05 29 713
56a33
> 2019 05 30 1970
65c42
< 2019 06 01 2503
---
> 2019 06 01 2505
68c45
< 2019 06 01 769
---
> 2019 06 01 765
82c59
< 2019 06 05 450
---
> 2019 06 05 410
89d65
< 2019 06 08 382
95a72
> 2019 06 10 37526
98d74
< 2019 06 10 886
106d81
< 2019 06 12 809
114a90,102
> 2019 06 16 1010
```

**Note:** Pay close attention to the red transactions because these are the ones
that your credit has been charged for, but you haven't made a record in GnuCash.

## Assumptions

- You have `awk`, `diff`, `sort` installed
- The statement and our GnuCash export are in the same currency
