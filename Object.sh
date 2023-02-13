Object () {
  # e.g account
  kind=$1

  # e.g leandroAccount
  self=$2

  shift 
  shift

  # iterates over the remaining args
  for arg in "$@"; do
    # e.g name=Leandro becomes ARG_KEY=name ARG_VALUE=Leandro
    read ARG_KEY ARG_VALUE <<< $(echo "$arg" | sed -E "s/(\w+)=(.*?)/\1 \2/")
    read FUNC <<< $(echo "$arg" | sed -E "s/fn_(\w+)$/\1/")

     if [[ ! -z "$ARG_KEY" ]] && [[ ! -z "$ARG_VALUE" ]]; then
          # declare the object's state!!!!
          # e.g export leandroAccount_balance=100
          export ${self}_$ARG_KEY="$ARG_VALUE"
     elif [[ ! -z "$FUNC" ]] && [[ "$FUNC" != "$self" ]]; then
          ## Define the function in the global scope, prepending the object kind, e.g account_fn_display, user_fn_logout etc
          export ${kind}_fn_$FUNC="$FUNC"      
    fi
  done
}
