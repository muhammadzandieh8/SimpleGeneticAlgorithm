% Clear
clc , clear , close all
%Params Must Be Set
popSize = 10;
maxGeneration = 100;
nVar = 10;
elitism =0.5;
MP=0.6;
MR=0.1;
UpperLimit = 10;
LowerLimit =-10; 
Answers = 2;

newPopulation = zeros(popSize,Answers);
cost = zeros(popSize,1);
fitn = zeros(popSize,1);
parent1= zeros(1,Answers);
parent2= zeros(1,Answers);

% if you want handel manualy MyBestCost
MyBestCost = 100 ;
%Number of times  the best_cost are compared to break algorithm
countReaptedCost = 0;
LastBestCost = 0; 
BestCost = 0 ;
LimitcountReaptedCost = 50;

% Create Population
chromosome = randi([LowerLimit, UpperLimit],popSize,Answers);

% Genetic Algorithm
for Generation=1:maxGeneration
    Generation
    for i =1:popSize
        cost(i)=ceil(Fitness(chromosome(i,1),chromosome(i,2)));
%         if cost(i) == 0
%             cost(i) = 1;
%         end
        fitn(i) = 1/cost(i);
        if fitn(i) <0
            fitn(i)  = 0.0001;
        end        
    end    
    probs = fitn/sum(fitn);
    [val,idx] =sort(cost,'descend');
    best_cost(Generation)=val(1);
    LastBestCost =val(1);
    
    plot(Generation,best_cost(Generation),'k.')          
    hold on
    pause (0.01)
    
    if BestCost ~= LastBestCost
        countReaptedCost = 0;
    end

    BestCost = LastBestCost;
    if best_cost(Generation) == BestCost
        countReaptedCost = countReaptedCost+1;
%       countReaptedCost
    end
    
    if countReaptedCost == LimitcountReaptedCost
            break;
    end
    
    for i =1:popSize*elitism
        newPopulation(i,1) = chromosome(idx(i),1);
        newPopulation(i,2) = chromosome(idx(i),2);
    end
    
    for i=popSize*elitism+1:popSize
        idx1=randsrc(1,1,[1:popSize;probs']);
        idx2=randsrc(1,1,[1:popSize;probs']);
       
        parent1(1,1) = chromosome(idx1,1);
        parent1(1,2) = chromosome(idx1,2);
        parent2(1,1) = chromosome(idx2,1);
        parent2(1,2) = chromosome(idx2,2);
        % Crossover Parents
        [child1,child2] = Crossover(parent1,parent2,LowerLimit, UpperLimit);
        if rand > MP
        % Mutation Children
            child1 = Mutation(child1,MR,LowerLimit, UpperLimit);
        end 
        
        newPopulation(i,1) = child1(1,1);
        newPopulation(i,2) = child1(1,2);
        
    end  

    chromosome = newPopulation;    
end
