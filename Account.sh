source ./Object.sh

Account() {
  display() {
    self=$1

    name=${self}_name
    balance=${self}_balance

    echo "Hello, ${!name}. Your balance is ${!balance}"
  }

  deposit() {
    self=$1

    currentBalance=${self}_balance
    amount=$2

    export ${self}_balance=$(($currentBalance + $amount))
  }

  Object account "$@"
  Object account $1 fn_display
  Object account $1 fn_deposit
}
