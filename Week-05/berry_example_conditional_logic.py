strawb = input('Strawberry? Y/N: ')
blueb = input('Blueberry? Y/N: ')
fresh = input('Are the berries fresh? Y/N: ')

if (strawb =='Y' or blueb =='Y') and fresh == 'Y':
    print('Buy it!')
else:
    print("Don't buy it")