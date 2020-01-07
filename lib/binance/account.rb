# frozen_string_literal: true

module Binance
  class Account
    class << self
      def all_coins
        Client.private_send(:get, '/sapi/v1/capital/config/getall')
      end

      def snapshot(type:)
        Client.private_send(
          :get,
          '/sapi/v1/accountSnapshot',
          params: {
            type: type
        })
      end

      alias balance snapshot

      def disable_fast_withdraw_switch
        Client.private_send(
          :post,
          '/sapi/v1/account/disableFastWithdrawSwitch'
        )
      end

      def withdraw(asset:, address:, amount:, params: {})
        Client.private_send(
          :post,
          '/wapi/v3/withdraw.html',
          params: params.merge(
            asset: asset,
            address: address,
            amount: amount
          )
        )
      end
    end
  end
end
