local file = readfile("letters.txt")
local a = {}

for letter in file:gmatch(".") do
  if letter ~= "\r" and letter ~= "\n" then
    table.insert(a, letter)
  end
end

for i, v in ipairs(a) do
  print(i, v)
end

for b, c in ipairs(a) do
    local d = "variable_" .. tostring(b)
    _G[d] = c
end
for b, c in ipairs(a) do
    local e = string.rep("  ", 2 * (b - 1))
    game.Players:Chat("h/ Hello there people\n\n\n\n\n\n\n" .. e .. _G["variable_" .. tostring(b)])
end
