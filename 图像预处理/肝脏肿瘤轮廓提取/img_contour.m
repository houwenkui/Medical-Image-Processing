function [img] = img_contour(Image_dicom,dim)
%-- ���ߣ����� ������ѧ
%-- ʱ�䣺2019��
%-- ��Ŀ���ΰ���������
%-- ��ȡDICOMͼ������
Image_dicom=im2bw(Image_dicom);
contour = bwperim(Image_dicom); 
contour = double(im2uint8(contour));
if dim == 3
    img(:,:,1)=contour;
    img(:,:,2)=0;
    img(:,:,3)=0;
else
    img=contour;
end
end


