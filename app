from past.builtins import xrange
dict={'b1':[3,4],'b2':[2,5],'b3':[5,7]}
#convert the dict into list of bbs according to the number of peices
def convert_dict_into_list_of_bbs(dict):
    biglist=[]
    for item in dict:
        for i in xrange((dict[item][0])):
            biglist.append(item)
    return biglist

#create dict with key of number and value of bbs
def create_last_dict(list):
    lastdict={}
    for i in xrange(len(list)):
        lastdict[str(i)]=list[i]
    return lastdict

def partitions(set_):
    if not set_:
        yield []
        return
    for i in xrange(2 ** len(set_) // 2):
        parts = [set(), set()]
        for item in set_:
            parts[i & 1].add(item)
            i >>= 1
        for b in partitions(parts[1]):
            yield [parts[0]] + b


listoflists = []

#return list of lists of numbers from lastdict
def get_partitions(set_):
    for partition in partitions(set_):
        listoflists.append(([list(elt) for elt in partition]))
    return (listoflists)

#return the lisoflists into bbs
def convertlist_of_lists_into_bbs(list):
    LIST=[]
    for i in xrange(len(list)):
        if list[i] not in LIST:
            LIST.append(list[i])
    for i in xrange(len(LIST)):
        for j in xrange(len(LIST[i])):
            for k in xrange(len(LIST[i][j])):
                LIST[i][j][k]=create_last_dict(convert_dict_into_list_of_bbs(dict))[LIST[i][j][k]]
                # print(lastdict[list[i][j][k]])
    return LIST

#return the length of the big list
def SUMOFBIGLIST(list):
    sum = 0
    for i in xrange(len(list)):
        for j in xrange(len(list[i])):
            sum = sum + dict[list[i][j]][1]
    return sum

#return the length of the small list
def Sum(list):
    sum=0
    for i in xrange(len(list)):
        sum = sum + dict[list[i]][1]
    return sum


def sum(list):
    sum=0
    for i in xrange(len(list)):
        sum=sum+list[i]
    return sum

#return the list after removing all lists bigger than 12m
def remove_over_lengthy_combination(list):
    for i in xrange(len(list)):
        for j in xrange(len(list[i])):
            if Sum(list[i][j])>12:
                list[i][j]=[]
    return list

#convert the bars number to lengths
def convert_names_into_lengths(list):
    for i in xrange(len(list)):
        for j in xrange(len(list[i])):
            for k in xrange(len(list[i][j])):
                # list[i][j][k]=dict[[list[i][j][k]]][1]
                print(list[i][j][k])
    return list



#return the length of the whole bars
def the_whole_length():
    list = ((convert_dict_into_list_of_bbs(dict)))
    return Sum(list)


def get_logic_list(list):
    logiclist=[]
    for i in xrange(len(list)):
        if SUMOFBIGLIST(list[i])==the_whole_length():
            logiclist.append(list[i])
            print(list[i])
    return logiclist




def the_min_lost_list():
    list=get_logic_list(remove_over_lengthy_combination(convertlist_of_lists_into_bbs(get_partitions(create_last_dict(convert_dict_into_list_of_bbs(dict))))))
    losslist=list
    sum=0
    for i in xrange(len(list)):
        for j in xrange(len(list[i])):
            losslist[i][j]=12-Sum(list[i][j])
    return losslist
def the_min_lost(list):
    minloss=[]
    for i in xrange(len(list)):
        minloss.append(sum(list[i]))
    return min(minloss)



print(remove_over_lengthy_combination(convertlist_of_lists_into_bbs(get_partitions(create_last_dict(convert_dict_into_list_of_bbs(dict))))))









