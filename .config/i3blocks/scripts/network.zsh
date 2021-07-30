#!/usr/bin/env zsh

I3BLOCKS_NETWORK_DEVICE=${I3BLOCKS_NETWORK_DEVICE:-$(networkctl list | awk '$4=="routable"{print $2}')}
I3BLOCKS_NETWORK_INTERVAL=${I3BLOCKS_NETWORK_INTERVAL:-1.0}

statistics="/sys/class/net/$I3BLOCKS_NETWORK_DEVICE/statistics"
unset rx_prev tx_prev

while :; do
  rx=$(cat "$statistics/rx_bytes"); tx=$(cat "$statistics/tx_bytes")
  if [[ -v rx_prev && -v tx_prev ]]; then
    rx_speed=$(numfmt --to=iec --suffix=bps --padding=8 $(( [#10] (rx - rx_prev) / I3BLOCKS_NETWORK_INTERVAL * 8 )))
    tx_speed=$(numfmt --to=iec --suffix=bps --padding=8 $(( [#10] (tx - tx_prev) / I3BLOCKS_NETWORK_INTERVAL * 8 )))
    echo "D: $rx_speed / U: $tx_speed"
  else
    echo "D: -------- / U: --------"
  fi
  rx_prev=$rx; tx_prev=$tx
  sleep $I3BLOCKS_NETWORK_INTERVAL
done
