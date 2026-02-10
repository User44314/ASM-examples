from car import Car
from car import ElectricCar
from electric_car import ElectricCar as EC
import electric_car as ec


my_leaf = ElectricCar('nissan', 'leaf', 2024)
print(my_leaf.get_descriptive_name())
my_leaf.battery.describe_battery()
my_leaf.battery.get_range()



my_mustang = Car('ford', 'mustang', 2024)
print(my_mustang.get_descriptive_name())
my_leaf = ElectricCar('nissan', 'leaf', 2024)
print(my_leaf.get_descriptive_name())


my_leaf = EC('nissan', 'leaf', 2024)
my_leaf = ec.ElectricCar('nissan', 'leaf', 2024)