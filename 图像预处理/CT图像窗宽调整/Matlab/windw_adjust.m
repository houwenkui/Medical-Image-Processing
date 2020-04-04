function [img] = windw_adjust(img,info)
%-- ���ߣ����� ������ѧ
%-- ʱ�䣺2019��
%-- ��Ŀ���ΰ���������
%-- ����DICOMͼ�񴰿���λ
%-- img��info�ֱ�Ϊ��dicomread��dicominfo������ȡ����ͼ����Ϣ
WindowCenter = info.WindowCenter(1)/info.RescaleSlope - info.RescaleIntercept; %info.WindowCenter=40
WindowWidth = info.WindowWidth(1)/info.RescaleSlope;
I = mat2gray(img,[WindowCenter-(WindowWidth/2),WindowCenter+(WindowWidth/2)]); % window
img = double(im2uint8(I));
%fd.Hu = img/255*info.WindowWidth(1)+WindowCenter(1)-(WindowWidth(1)/2)+info.RescaleIntercept; % CT intensity (Hu)
end