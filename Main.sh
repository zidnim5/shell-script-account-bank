source ./Account.sh

Account accountA name=Leandro balance=100
Account accountB name=John balance=500

$account_fn_deposit accountA 50

$account_fn_display accountA
$account_fn_display accountB