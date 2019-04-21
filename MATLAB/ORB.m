%%The main program,the data of photo1 is  manual imported
rawdata=rgb2gray(photo1);
m=size(rawdata);
rawdata=imresize(rawdata,540/m(1,1));%%change the size of the photo

%%%%%%%%%%%
%find the dast deature detector
%%%%%%%%%%%
m=size(rawdata);
count1=0;
list1=[-3,0;-3,1;-2,2;-1,3;0,3;1,3;2,2;3,1;
    3,0;3,-1;2,-2;1,-3;0,-3;-1,-3;-2,-2;-3,-1];
list2=[];
for i=4:(m(1,1)-3)
    for j=4:(m(1,2)-3)
        count2=0;
        for k=1:16
            if abs(rawdata(list1(k,1)+i,list1(k,2)+j)-rawdata(i,j))>63
               count2=count2+1;
            end
        end
        if count2>7
            count1=count1+1;
            list2(count1,:)=[i,j];
        end
          
    end
end


%%%%%%%%%%%%
%find the ORB feature descritors
%%%%%%%%%%%%

% ??????
m=size(list2)
for i=1:m(1,1)
    reg=0;
    for j=1:16
        reg2= rawdata(list2(i,1)+list1(j,1),list2(i,2)+list1(j,2))-rawdata(list2(i,1),list2(i,2));
        if reg2>reg
            reg=reg2;
            list2(i,3)=j;
        end
    end
end

%list2 ? 3?11 ?????
for i=1:m(1,1)
    for j=1:8
        x=rem(j+list2(i,3)-1,16)+1;y=rem(j+8+list2(i,3)-1,16)+1;
        if rawdata(list2(i,1)+list1(x,1),list2(i,2)+list1(x,2))>rawdata(list2(i,1)+list1(y,1),list2(i,2)+list1(y,2))
        list2(i,3+j)=1;
        else list2(i,3+j)=0;
        end
    end
end
list2
