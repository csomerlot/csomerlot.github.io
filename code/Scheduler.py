import csv, pprint, random

Population_Size = 5000
Litter_Size = 3
Mutation_Rate = 5

week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
shifts = ["Morning", "Afternoon", "Evening"]

def fitness_score(schedule, rules):
    score = 0
    # Rules by schedule
    
    # check at least 1 person has keys for open and close
    
    
    
    
    # Rules by person
    for emp in schedule["ByPerson"]:
        # print emp
        # check total
        if len(schedule["ByPerson"][emp]) > rules[emp]["ShiftsPerWeek"]: 
            score+= len(schedule["ByPerson"][emp]) - rules[emp]["ShiftsPerWeek"]
            # print "\tToo many shifts", score
        
        weekend = 0
        morning = 0
        afternn = 0
        evening = 0
        for shift_desc in schedule["ByPerson"][emp]:
                if "Saturday"  in shift_desc or "Sunday" in shift_desc: weekend+=1
                if "Morning"   in shift_desc: morning+=1
                if "Afternoon" in shift_desc: afternn+=1
                if "Evening"   in shift_desc: evening+=1
                
        # check works weekends
        if not rules[emp]["WorksWeekends"]: 
            score+=weekend
            # print "\tNo weekends", score
            
        # check morning, afternoon, evening shift
        if not rules[emp]["WorksMornings"]: 
            score+=morning
            # print "\tMornings bad", score
        if not rules[emp]["WorksAfternoons"]: 
            score +=afternn
            # print "\tAfternoons bad", score
        if not rules[emp]["WorksEvenings"]: 
            score +=evening
            # print "\tEvenings bad", score
            
        # check only back-to-back double shifts
    # print 
    return score

def getRules(url):
    rules = {}
    with file(url, 'rb') as csvFile:
        data = csv.DictReader(csvFile)

        for row in data:
            rules[row['Employee']] = {}
            for k in row:
                val = row[k]
                if val == 'TRUE': val = True
                if val == 'FALSE': val = False
                try:
                    val = int(val)
                except ValueError:
                    pass
                rules[row['Employee']][k] = val
    return rules
    
def mutate(individual):
    for gene in individual["gene_dict"]:
        if random.randint(0,100) <= Mutation_Rate:
            individual["gene_dict"][gene] = random.randint(1,9)
    #individual["fitness"] = fitness_score(individual["gene_dict"])
    return individual

def mortality(population): #sort individuals (list by fitness score), kill off least fit
    sortedPop = sorted(population) #sorted function accepts any iterable, where list.sort does not
    return sortedPop[:Population_Size]

def reproduction(population, rules):
    nextGen = []
    for i in range(len(population)/2):
        parent_1 = random.choice(population)
        parent_2 = random.choice(population)
##        while parent_1 == parent_2:
##            parent_2 = random.choice(population)

        for offspring in range(Litter_Size):
        
            schedule = {"ByDay":{}, "ByPerson":{}}
            
            for day in week:
                schedule["ByDay"][day] = {}
                for shift in shifts:
                    schedule["ByDay"][day][shift] = []
                    desc = day + " " + shift
                    for p in range(2):
                        parent = random.choice(population)
                        person = random.choice(parent[1]["ByDay"][day][shift])
                        while person in schedule["ByDay"][day][shift]:
                            parent = random.choice(population)
                            person = random.choice(parent[1]["ByDay"][day][shift])
                        schedule["ByDay"][day][shift].append(person)
                        if person not in schedule["ByPerson"]:
                            schedule["ByPerson"][person] = []
                        schedule["ByPerson"][person].append(desc)
                    
            fitness = fitness_score(schedule, rules)
            
            nextGen.append((fitness, schedule))
    return nextGen
    
def makeRandomSchedule(rules):
    schedule = {"ByDay":{}, "ByPerson":{}}
    employees = rules.keys()
    for day in week:
        schedule["ByDay"][day] = {}
        for shift in shifts:
            schedule["ByDay"][day][shift] = []
            desc = day + " " + shift
            for p in range(2):
                person = random.choice(employees)
                while person in schedule["ByDay"][day][shift]:
                    person = random.choice(employees)
                schedule["ByDay"][day][shift].append(person)
                if person not in schedule["ByPerson"]:
                    schedule["ByPerson"][person] = []
                schedule["ByPerson"][person].append(desc)
            
    fitness = fitness_score(schedule, rules)
    
    return fitness, schedule
    
def evolve(rules):

    # make initial random population
    population = []
    for i in range(Population_Size+1):
        population.append(makeRandomSchedule(rules))
    best = sorted(population)[0][0]
    
    # main evolution loop 
    GenerationCount = 0
    while best > 0:
        newpop = mortality(population)
        population = sorted(newpop + reproduction(newpop, rules))
        best = population[0][0]
        GenerationCount +=1
        print GenerationCount, best
    
    pprint.pprint(population[0][1])
    
if __name__ == '__main__':
    rules = getRules("https://docs.google.com/spreadsheets/d/1IvTSl58Angp1-4FTa40G_7dn3hJZPZtCXY63oiLOJJ8/pub?gid=0&single=true&output=tsv")
    evolve(rules)