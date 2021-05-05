# 自动化测试

## 依赖
pip install matplotlib

pip install pytest

pip install allure-pytest


## 环境
### 环境变量
`parent_path = os.path.dirname(sys.path[0]) 
if parent_path not in sys.path:
    sys.path.append(parent_path)`
    
### 使用pytest
左上角file->Setting->Tools->Python Integrated Tools->项目名称->Default test runner->选择py.test

### 使用allure
1. 下载：https://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/2.13.9/
2. path中添加

## 已知缺陷
* ~~iops/带宽值小于4的情况下无法生成barfix 21-0428）~~
* ~~图片路径不能复原（fix 21-0428）~~
* 没有转换KB/s为MB/s
* ~~特殊数值导致bar脚本无法复原（fix 21-0429）~~
* ~~iops带k情况下最大值取不到的问题（fix 21-0505）~~

## 待优化
* 支持中文
* 传参问题，以精简代码
* ~~图表生成~~
* ~~$3支持选择执行步骤~~
* ~~最大值生成~~
* bw、iops判断大小的优化




