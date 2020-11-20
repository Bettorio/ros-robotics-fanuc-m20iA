#include <ros/ros.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>

using namespace std;

int main (int argc, char **argv) {

    ROS_INFO("Intializing node /tf_listener");
    ros::init(argc, argv, "tf_listener");
    ros::NodeHandle n;

    tf2_ros::Buffer tf_buffer;
    tf2_ros::TransformListener tf_listener(tf_buffer);

    ros::Rate rate(1.0);

    while(ros::ok()) {

        // Store transforms received
        std::vector<geometry_msgs::TransformStamped> transforms(6);

        try {
            transforms[0] = tf_buffer.lookupTransform("base_link", "link_6", ros::Time(0));
            transforms[1] = tf_buffer.lookupTransform("link_1", "link_6", ros::Time(0));
            transforms[2] = tf_buffer.lookupTransform("link_2", "link_6", ros::Time(0));
            transforms[3] = tf_buffer.lookupTransform("link_3", "link_6", ros::Time(0));
            transforms[4] = tf_buffer.lookupTransform("link_4", "link_6", ros::Time(0));
            transforms[5] = tf_buffer.lookupTransform("link_5", "link_6", ros::Time(0));
        } catch (tf2::TransformException ex) {
            ROS_WARN("%s", ex.what());
            ros::Duration(1.0).sleep();
        }

        for (int i = 0; i < transforms.size(); i++) {
            std::ostringstream str;

            str << std::endl << std::endl << "******** Tranformation from " << transforms[i].header.frame_id << " to " << transforms[i].child_frame_id << " *********" << std::endl;
            str << std::endl << "------- Translation -------" << std::endl;
            str << transforms[i].transform.translation << std::endl;

            tf2::Quaternion quaternion;
            tf2::fromMsg(transforms[i].transform.rotation, quaternion);
            tf2::Vector3 rotation_axis = quaternion.getAxis();

            str << std::endl << "------- Axis/Angle -------" << std::endl;
            str << "Axis = [ " << rotation_axis.getX() << " " << rotation_axis.getY() << " " << rotation_axis.getZ() << " ]" << std::endl;
            str << "Angle = [ " << quaternion.getAngle() << " ]" << std::endl;

            tf2::Matrix3x3 matrix(quaternion);

            str << std::endl << "------- Rotation Matrix -------" << std::endl;
            str << "[ " << matrix[0][0] << " " << matrix[0][1] << " " << matrix[0][2] << " ]" << std::endl;
            str << "[ " << matrix[1][0] << " " << matrix[1][1] << " " << matrix[1][2] << " ]" << std::endl;
            str << "[ " << matrix[2][0] << " " << matrix[2][1] << " " << matrix[2][2] << " ]" << std::endl;
            
            tf2Scalar roll, pitch, yaw;
            matrix.getRPY(roll, pitch, yaw);
            str << std::endl << "------- Euler Angles -------" << std::endl;
            str << "RPY = [ " << roll << " " << pitch << " " << yaw << " ]" << std::endl;

            ROS_INFO_STREAM(str.str());
        }

        rate.sleep();
        ros::spinOnce();

    }

    ros::shutdown();

    return 0;
}
