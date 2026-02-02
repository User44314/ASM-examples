import pizza
import pizza as p


pizza.make_pizza(16, 'pepperoni')
pizza.make_pizza(12, 'mushrooms', 'green peppers', 'extra cheese')


from pizza import make_pizza
make_pizza(16, 'pepperoni')
make_pizza(14, 'mushrooms', 'green peppers', 'extra cheese')


from pizza import make_pizza as mp  #unique alias—an alternate name similar to a nickname for the function.
mp(16, 'pepperoni')
mp(12, 'mushrooms', 'green peppers', 'extra cheese')


p.make_pizza(16, 'pepperoni')
p.make_pizza(12, 'mushrooms', 'green peppers', 'extra cheese')


from pizza import *   #mporting All Functions in a Module
make_pizza(16, 'pepperoni')
make_pizza(16, 'mushrooms', 'green peppers', 'extra cheese')

