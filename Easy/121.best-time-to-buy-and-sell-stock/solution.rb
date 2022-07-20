# timestamp: 2022-07-19T15:34:49+08:00
# question: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

# train of thought
<<~THOUGHT
  profit =
   { n > 1, m: max(price[n] - 看前面幾天可以買到的最便宜價格, 0))
   { n == 1: -1
THOUGHT

# code goes here
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  profit = 0
  min_cost_til_now = 10001
  prices.each_with_index do |price, i|
    if price < min_cost_til_now
      min_cost_til_now = price
    elsif price - min_cost_til_now > profit
      profit = price - min_cost_til_now
    end
  end
  profit
end
