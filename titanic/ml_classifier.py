import pickle

def classification_model(pclass, sex, age, sibsp, parch, fare, embarked, title):
    x = [[pclass, sex, age, sibsp, parch, fare, embarked, title]]
    randomforest = pickle.load(open('titanic_model.sav', 'rb'))
    output = randomforest.predict(x) 
    if output == 0:
        output = "Not survived"
    elif output == 1:
        output = "Survived"
    else:
        output = "Error"
    return output
