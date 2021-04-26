import React from 'react';
import { ProSidebar, Menu, MenuItem, SubMenu } from 'react-pro-sidebar';
import 'react-pro-sidebar/dist/css/styles.css';
// @import '~react-pro-sidebar/dist/scss/styles.scss';


function MyProsidebar(props) {
  return <ProSidebar>
    <Menu iconShape="square">
      {/* <MenuItem icon={<FaGem />}>Dashboard</MenuItem>
      <SubMenu title="Components" icon={<FaHeart />}> */}
      <MenuItem>Dashboard</MenuItem>
      <SubMenu title="Components">
        <MenuItem>Component 1</MenuItem>
        <MenuItem>Component 2</MenuItem>
      </SubMenu>
    </Menu>
  </ProSidebar>;
}

export default MyProsidebar;