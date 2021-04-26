import React, {useEffect} from 'react';
import { ProSidebar, Menu, MenuItem, SubMenu } from 'react-pro-sidebar';
import 'react-pro-sidebar/dist/css/styles.css';
import { FaTachometerAlt, FaGem, FaList, FaGithub, FaRegLaughWink, FaHeart } from 'react-icons/fa';

// @import '~react-pro-sidebar/dist/scss/styles.scss';


function MyProsidebar(props) {
  useEffect(() => {
    console.log("My Prosidebar")
    fetch('/api/rooms')
      .then(res => { console.log(res); return res.json(); })
      .then(res => { console.log(res); return res; })
  }, [])
  return <ProSidebar>
    <Menu iconShape="square">
      <MenuItem icon={<FaGem />}>Dashboard</MenuItem>
      <MenuItem icon={<FaGithub />}>Bla bla bla</MenuItem>
      <SubMenu title="Components" icon={<FaHeart />}>
      {/* <MenuItem>Dashboard</MenuItem>
      <SubMenu title="Components"> */}
        <MenuItem icon={<FaGithub />}>Component 1</MenuItem>
        <MenuItem icon={<FaGithub />}>Bla bla bla</MenuItem>
        <MenuItem>Component 2</MenuItem>
      </SubMenu>
    </Menu>
  </ProSidebar>;
}

export default MyProsidebar;