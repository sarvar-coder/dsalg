from collections import deque

def search(startNode, target = 'elon musk'):
    searchQueue = deque()
    searchQueue += graph[startNode]
    searched = set()


    while searchQueue:
        person = searchQueue.popleft()
        if person not in searched:
            if target == person:
               print(f'{target} ni topdik')
               # print(searched)
               return True
            else:
                 searchQueue += graph[person]
                 searched.add(person)
    return False            


if __name__ == '__main__':
    graph = {
        'siz': ['ali', 'vali', 'tohir'],
        'ali': ['aziza', 'olim'],
        'vali': ['botir', 'ziyoda'],
        'tohir': ['elon musk', 'mohir'],
        'ziyoda': ['aziza'],
        'olim': [], 
        'aziza': [], 
        'botir': [],
        'elon musk': [],
        'mohir': [] 
    }

    search('siz', 'mohir')