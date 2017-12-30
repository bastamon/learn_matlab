function result=sortdescend(inputdata)
len=length(inputdata);
inputdata1=inputdata;
for j=(len-1):-1:1
    for i=1:j;
        if(inputdata1(i)<inputdata1(i+1));
            tmp=inputdata1(i);
            inputdata1(i)=inputdata1(i+1);
            inputdata1(i+1)=tmp;
        end
    end
end
result=inputdata1;