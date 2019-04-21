#pragma comment(lib,"opencv_world410d.lib")
#include <opencv2/core/core.hpp>
#include <opencv2/features2d/features2d.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/types_c.h>
#include <vector>
#include <ctime>

using namespace cv;
using namespace std;

int main()
{
	clock_t start, stop;
	start = clock();
	double time = 0;
	for (int i = 0; i < 100; i++)
	{
		
		Mat img = imread("C:\\Users\\cymfg\\OneDrive\\文档\\SLAM\\Matlab Modelsim\\timg.jpg");
		Mat GrayImg;
		if (img.channels() == 3)
		{
			cvtColor(img, GrayImg, CV_RGB2GRAY);
		}
		else
		{
			img.copyTo(GrayImg);
		}
		imshow("nature", GrayImg);
		vector<KeyPoint> keypoints;
		Ptr<FastFeatureDetector> fast = FastFeatureDetector::create(30);
		fast->detect(GrayImg, keypoints);

		Mat img_keypoints;
		drawKeypoints(GrayImg, keypoints, img_keypoints, Scalar::all(-1), DrawMatchesFlags::DEFAULT);

		imshow("Keypoints", img_keypoints);
		imwrite("fast_detection_result.png", img_keypoints);

		img.empty();
		GrayImg.empty();
		img_keypoints.empty();
	}
	stop = clock();
	double endtime = (double)(stop - start)/100 / CLOCKS_PER_SEC;		
	cout << "Total time:" << endtime << endl;
	//waitKey(0);
	return 0;
}

